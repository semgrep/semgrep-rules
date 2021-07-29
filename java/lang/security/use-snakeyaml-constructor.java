import org.yaml.snakeyaml.Yaml;
import org.yaml.snakeyaml.constructor.SafeConstructor;

public class SnakeYamlTestCase {
    public void unsafeLoad(String toLoad) {
        // ruleid:use-snakeyaml-constructor
        Yaml yaml = new Yaml();
        yaml.load(toLoad);
    }

    public void safeConstructorLoad(String toLoad) {
        // ok:use-snakeyaml-constructor
        Yaml yaml = new Yaml(new SafeConstructor());
        yaml.load(toLoad);
    }

    public void customConstructorLoad(String toLoad, Class goodClass) {
        // ok:use-snakeyaml-constructor
        Yaml yaml = new Yaml(new Constructor(goodClass));
        yaml.load(toLoad);
    }
}
