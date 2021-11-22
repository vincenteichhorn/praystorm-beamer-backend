<?php
  abstract class RequestStatus {
    const ok = "HTTP/1.1 200";
    const badRequest = "HTTP/1.1 400";
    const methodNotAllowed = "HTTP/1.1 405";
  }
?>