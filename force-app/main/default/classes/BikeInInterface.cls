public class BikeInInterface implements VehicleInterface{
  public string wheels;
    public string color;
    public void vehicleProperties(){
        string wheels = 'two wheels';
        string color = 'Black';
        system.debug('Bike properties are---' + wheels +'' + color);
    }
}