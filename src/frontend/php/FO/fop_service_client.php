<?php

require_once 'http_client.php';

/**
 * A client to consume the FOP Service.
 * @author Roland Christen <roland.christen@hslu.ch>
 */
class FOPServiceClient {

    // service connection parameter
    const SERVER = 'j4lfop.enterpriselab.ch';
    const QUERY = '/fop/service.php';

    /**
     * @param string $foFilePath The filepath to the FO file to be rendered.
     * @param string $pdfFilePath Optional. The filepath were to save the generated PDF file.
     * @return string The filepath to the generated PDF file.
     */
    public function processFile($foFilePath, $pdfFilePath = null) {

        // create output path if not specified.
        if (is_null($pdfFilePath)) {
            $pdfFilePath = $this->replaceExtension($foFilePath, 'pdf');
        }

        // read source file and generate PDF file.
        $foData = $this->readFile($foFilePath);
        $pdfData = $this->renderFile($foData);
        $this->writeFile($pdfData, $pdfFilePath);

        return $pdfFilePath;
    }

    /**
     * Replaces the file extension of a given filepath.
     * @param string $filePath The original filepath.
     * @param string $newExtension The new file extension.
     * @return string The filepath with the replaced file extension.
     */
    private function replaceExtension($filePath, $newExtension) {
        $parts = pathinfo($filePath);
        $builder = array();
        if ($parts['dirname'] != '.') {
            $builder[] = $parts['dirname'];
            $builder[] = DIRECTORY_SEPARATOR;
        }
        $builder[] = $parts['filename'];
        $builder[] = '.';
        $builder[] = $newExtension;
        return implode('', $builder);
    }

    /**
     * @param string $foData Content of FO file.
     * @return string Content of PDF file.
     * @throws RuntimeException
     */
    private function renderFile($foData) {

        // call web service
        $httpClient = new HTTPClient(self::SERVER);
        $response = $httpClient->postRequest(self::QUERY, $foData);

        // check result
        $header = $response[0];
        if ($header->getStatusCode() !== HTTPHeader::STATUS_OK) {
            $error = sprintf('Request failed. Server responsed "%s - %s (%s)"', $header->getStatusCode(), $header->getStatusName(), $response[1]);
            throw new RuntimeException($error);
        }

        // return renedered PDF
        $pdfData = $response[1];
        return $pdfData;
    }

    /**
     * @param string $data File content.
     * @param string $filePath Filepath.
     * @throws RuntimeException
     */
    private function writeFile($data, $filePath) {

        // open file
        $fileHandle = fopen($filePath, 'w');
        if (!$fileHandle) {
            throw new RuntimeException(sprintf('Cannot write File "%s"', $filePath));
        }

        // write content
        fwrite($fileHandle, $data);
        fclose($fileHandle);
    }

    /**
     * @param string $filePath
     * @return string
     * @throws RuntimeException
     */
    private function readFile($filePath) {

        // open file
        $fileHandle = fopen($filePath, 'r');
        if (!$fileHandle) {
            throw new RuntimeException(sprintf('Cannot read File "%s"', $filePath));
        }

        // read lines
        $lines = array();
        while (!feof($fileHandle)) {
            $lines[] = fgets($fileHandle);
        }

        // close file
        fclose($fileHandle);

        // return contents as string
        return implode("\n", $lines);
    }

}
