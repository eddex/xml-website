<?php

require_once 'http_header.php';

/**
 * A simple client to perform HTTP requests.
 * @author Roland Christen <roland.christen@hslu.ch>
 */
class HTTPClient {
    // stream terminating characters 

    const TERMINATOR = "\r\n";

    // connection parameters
    private $host;
    private $port = 80;

    /**
     * 
     * @param type $host The hostname or address to connect to.
     * @param type $port The port number to use for the request.
     */
    public function __construct($host, $port = 80) {
        $this->host = $host;
        $this->port = $port;
    }

    private function openConnection() {

        // try to open socket
        $errorNumber = null;
        $errorMessage = null;
        $connection = fsockopen($this->host, $this->port, $errorNumber, $errorMessage, 30);

        // throw exception in case of failure
        if (!$connection) {
            throw new RuntimeException(sprintf('Failed to connect to server.\nError %s\n%s', $errorNumber, $errorMessage));
        }

        return $connection;
    }

    /**
     * @param resource $connection
     * @param string $query
     */
    private function sendPostHeader($connection, $query) {
        fputs($connection, sprintf('POST %s HTTP/1.1%s', $query, self::TERMINATOR));
        fputs($connection, sprintf('Host: %s%s', $this->host, self::TERMINATOR));
    }

    /**
     * @param resource $connection
     * @param string $data
     */
    private function sendPayload($connection, $data) {
        fputs($connection, sprintf('Content-type: text/xml%s', self::TERMINATOR));
        fputs($connection, sprintf('Content-length: %s%s', strlen($data), self::TERMINATOR));
        fputs($connection, sprintf('Connection: close%s%s', self::TERMINATOR, self::TERMINATOR));
        fputs($connection, $data);
    }

    /**
     * @param resource $connection
     * @return array An array containing the header as HTTPHeader object and the data as string.
     */
    private function getResponse($connection) {

        // retrieve the response from a given connection after a request.
        $response = '';
        while (!feof($connection)) {
            $response .= fgets($connection, 128);
        }

        // parse response
        $separator = self::TERMINATOR . self::TERMINATOR;
        $responseParts = explode($separator, $response, 2);
        $header = isset($responseParts[0]) ? HTTPHeader::parse($responseParts[0]) : '';
        $content = isset($responseParts[1]) ? $responseParts[1] : '';

        return array($header, $content);
    }

    /**
     * Performs a HTTP post request with a given query (server script) and a given payload.
     * @param string $query The path on the server (server script)
     * @param string $data The payload for the request.
     * @return array The response from the server {header:HTTPHeader, data:string).
     */
    public function postRequest($query, $data) {

        // connect and send request headers:
        $connection = $this->openConnection();
        $this->sendPostHeader($connection, $query);

        // send payload
        $this->sendPayload($connection, $data);

        // receive response
        $response = $this->getResponse($connection);

        // close connection:
        fclose($connection);

        return $response;
    }

}