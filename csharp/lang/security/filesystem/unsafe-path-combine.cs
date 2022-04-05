public class Foo{

    public static bytes[] GetFileBad(string filename) { 
        // Ensure that all path elements are safe path elements. 
        if (string.IsNullOrEmpty(filename)) 
        {   
            throw new ArgumentNullException("error"); 
        }
        string filepath = Path.Combine("\\FILESHARE\images", filename); 
        // ruleid: unsafe-path-combine
        return File.ReadAllBytes(filepath);
    }

    public static bytes[] GetFileSafe(string filename) { 
        // Ensure that all path elements are safe path elements. 
        if (string.IsNullOrEmpty(filename)) 
        {   
            throw new ArgumentNullException("error"); 
        }
        filename = Path.GetFileName(filename);
        // ok: unsafe-path-combine
        string filepath = Path.Combine("\\FILESHARE\images", filename); 
        return File.ReadAllBytes(filepath);
    }

    public static bytes[] GetFileSafe2(string filename) { 
        // Ensure that all path elements are safe path elements. 
        if (string.IsNullOrEmpty(filename) || Path.GetFileName(filename) != filename) 
        {   
            throw new ArgumentNullException("error"); 
        }
        string filepath = Path.Combine("\\FILESHARE\images", filename); 
        // ok: unsafe-path-combine
        return File.ReadAllBytes(filepath);
    }

    public static bytes[] GetFileSafe3(string filename) { 
        // Ensure that all path elements are safe path elements. 
        if (string.IsNullOrEmpty(filename)) 
        {   
            throw new ArgumentNullException("error"); 
        }
        // ok: unsafe-path-combine
        string filepath = Path.Combine("\\FILESHARE\images", Path.GetFileName(filename)); 
    }

    public static bytes[] GetFileSafe4(string filename) { 
        // Ensure that all path elements are safe path elements. 
        if (string.IsNullOrEmpty(filename)) 
        {   
            throw new ArgumentNullException("error"); 
        }
        string otherPath = Path.GetFileName(filename);
        string safePath = Path.Combine("\\FILESHARE\images",otherPath);
        // ok: unsafe-path-combine
        return File.ReadAllBytes(safePath);
    }    
}