function encodeProductDescription (tableData: any[]) {
  for (let i = 0; i < tableData.length; i++) {
    // ruleid: detect-replaceall-sanitization
    tableData[i].description = tableData[i].description.replaceAll('<', '&lt;').replaceAll('>', '&gt;')

    // ok
    tableData[i].description = tableData[i].description.replaceAll('<', 'left angle bracket')
  }
}
