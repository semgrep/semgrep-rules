package deserialize;

import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.IOException;
import java.lang.ClassNotFoundException;
import org.apache.commons.io.input.ClassLoaderObjectInputStream;

import com.biz.org.UserData;

public class Cls
{
    public UserData deserializeObject1(InputStream receivedFile) throws IOException, ClassNotFoundException {
        // ruleid:object-deserialization
        ObjectInputStream in = new ObjectInputStream(receivedFile);
        return (UserData) in.readObject();
    }

    public UserData deserializeObject2(InputStream receivedFile) throws IOException, ClassNotFoundException {
        // ruleid:object-deserialization 
        try (ObjectInputStream in = new ObjectInputStream(receivedFile)) {
            return (UserData) in.readObject();
        } catch (IOException e) {
            throw e;
        }
    }

    public UserData deserializeObject3(InputStream receivedFile) throws IOException, ClassNotFoundException {
        // ruleid:object-deserialization 
        try (ObjectInputStream in = new ClassLoaderObjectInputStream(Thread.currentThread().getContextClassLoader(), receivedFile)) {
            return (UserData) in.readObject();
        } catch (IOException e) {
            throw e;
        }
    }
}
