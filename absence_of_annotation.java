public class DummyService extends ExposedService{

    private String state;

    public DummyService(){

    }

    private void changeInternalState(String p){
        state=p;
    }

    public ServiceResult Foo(){
        return new ServiceResult("foo");
    }

    @Authorization(admin=true)
    public ServiceResult Bar(){
        return new ServiceResult("bar");
    }

    public void Baz(String p){
        changeInternalState(p);
    }

} 
