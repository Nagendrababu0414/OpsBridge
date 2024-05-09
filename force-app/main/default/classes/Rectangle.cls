public class Rectangle implements shapeCalculator {
    private integer length;
    private integer width;
    public Rectangle(integer length,integer width){
        this.width=width;
        this.length=length;
    }
    public Decimal areaOfShapeCalc(){
            Decimal area = width*length;
            system.debug(area);
        return area;
    }
}