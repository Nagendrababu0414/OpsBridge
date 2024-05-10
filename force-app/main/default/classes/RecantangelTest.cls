@isTest
public class RecantangelTest {
  @isTest
    static void methodToTest(){
        Integer Length= 5;
        Integer width=10;
        shapeCalculator rc= new Rectangle(Length,width);
        Decimal area=rc.areaOfShapeCalc();
        system.assertEquals(50,area);
    }
}