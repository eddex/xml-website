<?php

/**
 * Represents the Header from a HTTP response and provides access to some key data.
 * @author Roland Christen <roland.christen@hslu.ch>
 */
class HTTPHeader {

    // stream terminating characters 
    const TERMINATOR = "\r\n";

    // header keys
    const CACHE_CONTROL = 'Cache-Control';
    const CONTENT_TYPE = 'Content-Type';
    const SERVER = 'Server';

    // HTTP status codes
    const STATUS_OK = '200';

    private $statusCode;
    private $statusName;
    private $headers = array();

    /**
     * Parses a response stream from a HTTP request and returns a HTTPHeader object, containing important data from the response.
     * @param string $response The response from the HTTP request.
     * @return HTTPHeader
     */
    public static function parse($response) {

        // extract header data
        $parts = explode(self::TERMINATOR . self::TERMINATOR, $response, 2);
        if (!isset($parts[0])) {
            return null;
        }
        $response = explode(self::TERMINATOR, $parts[0]);

        // extract status
        $ret = new HTTPHeader();
        $status = explode(' ', $response[0], 3);
        $ret->statusCode = $status[1];
        $ret->statusName = $status[2];

        // extract further headers
        $headerKeys = array(
            self::CACHE_CONTROL, self::CONTENT_TYPE, self::SERVER
        );
        foreach ($headerKeys as $key) {
            $ret->headers[$key] = self::extractHeader($key, $response);
        }

        return $ret;
    }

    /**
     * Returns the value for a given key from a HTTP response array.
     * @param type $key The key to the requested value.
     * @param array $response The HTTP response to search through.
     * @return string
     */
    private static function extractHeader($key, array $response) {

        // iterate response entries
        foreach ($response as $row) {

            // check if the key exists
            if (stripos($row, $key) === FALSE) {
                continue;
            }

            // extract value
            list($key, $value) = explode(':', $row, 2);
            return trim($value);
        }
    }

    private function __construct() {
        
    }

    public function getStatusCode() {
        return $this->statusCode;
    }

    public function getStatusName() {
        return $this->statusName;
    }

    public function getHeader($name) {
        if (!array_key_exists($name, $this->headers)) {
            return null;
        }
        return $this->headers[$name];
    }

}