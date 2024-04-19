@RequestMapping(path = "/api/discount/coupon", method = RequestMethod.GET)
public ResponseEntity<String> downloadFile(HttpServletRequest request) {

  //Parse URL parameter
  String file = "";
  if(request.getParameter("file") != null && 
    !request.getParameter("file").isEmpty()) {
      file = request.getParameter("file").toString();
  }

  ...

  // Load file as string
  String content = fileService.loadFileAsString(file);

  return ResponseEntity.ok()
        .contentType(MediaType.parseMediaType("application/octet-stream"))
        .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file + "\"")
                .body(content);
    }