// SuccessMessageController.cls
public class SuccessMessageController {
    public String successMessage { get; set; }
    
    // Remote Action to set the success message
    @RemoteAction
    public static String setSuccessMessage() {
        SuccessMessageController controller = new SuccessMessageController();
        controller.successMessage = 'Success! Your custom message here.';
        return controller.successMessage;
    }
}