<?php
  abstract class RequestStatus {
    const badRequest = "HTTP/1.1 400";
    const methodNotAllowed = "HTTP/1.1 405";
  }
?>