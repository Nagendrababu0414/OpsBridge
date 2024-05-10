public class CarInInterface implements VehicleInterface{
 public string wheels;
    public string color;
    public void vehicleProperties(){
        string wheels = 'Four wheels';
        string color = 'Red';
        system.debug('Car properties are-----' + wheels+'-----' + color);
    }
}