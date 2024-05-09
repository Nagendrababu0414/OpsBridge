public class SampleFutureClass {
    public static void sync1(){
        system.debug('run synchronously');
    }
    public static void sync2(){
        system.debug('run ssynchrnousely');
    }
    @future
    public static void async(){
        system.debug('run asynchronousely');
    }
}