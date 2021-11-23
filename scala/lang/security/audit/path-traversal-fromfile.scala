class Test {
  def bad1(value:String) = Action {
    if (!Files.exists(Paths.get("public/lists/" + value))) {
      NotFound("File not found")
    } else {
      // ruleid: path-traversal-fromfile
      val result = Source.fromFile("public/lists/" + value).getLines().mkString // Weak point
      Ok(result)
    }
  }

  def bad2(value:String) = Action {
    if (!Files.exists(Paths.get("public/lists/" + value))) {
      NotFound("File not found")
    } else {
      val filename1 = "public/lists"
      val filename = filename1 + value
      // ruleid: path-traversal-fromfile
      val result = Source.fromFile(filename).getLines().mkString // Weak point
      Ok(result)
    }
  }

  def bad3(value:String) = Action {
    if (!Files.exists(Paths.get("public/lists/" + value))) {
      NotFound("File not found")
    } else {
      // ruleid: path-traversal-fromfile
      val result = Source.fromFile("%s/%s".format("public/lists", value)).getLines().mkString // Weak point
      Ok(result)
    }
  }

  def bad4(value:String) = Action {
    if (!Files.exists(Paths.get("public/lists/" + value))) {
      NotFound("File not found")
    } else {
      var filename1 = "public/lists/"
      val filename = filename1.concat(value)
      // ruleid: path-traversal-fromfile
      val result = Source.fromFile(filename).getLines().mkString // Weak point
      Ok(result)
    }
  }

  def ok(value:String) = Action {
    val filename = "public/lists/" + FilenameUtils.getName(value)

    if (!Files.exists(Paths.get(filename))) {
      NotFound("File not found")
    } else {
      // ok: path-traversal-fromfile
      val result = Source.fromFile(filename).getLines().mkString // Fix
      Ok(result)
    }
  }
}
