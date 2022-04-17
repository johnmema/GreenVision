//
//  ViewController.swift
//  CustomVisionMicrosoftToCoreML
//

import UIKit
import AVKit
import Vision


enum wastes: String {
  case Bandaid = "Bandaid"
  case Battery = "Battery"
  case Bread = "Bread"
  case Bulb = "Bulb"
  case Cans = "Cans"
  case carton = "Carton"
  case chopsticks = "Chopsticks"
  case diapers = "Diapers"
  case dishes = "Dishes"
  case facialmask = "FacialMask"
  case glassbottle = "GlassBottle"
  case leftovers = "Leftovers"
  case medicinebottle = "MedicineBottle"
  case milkbox = "Milkbox"
  case napkin = "Napkin"
  case newspaper = "Newspaper"
  case nuts = "Nuts"
  case pen = "Pen"
  case plasticbag = "PlasticBag"
  case plasticbottle = "PlassticBottle"
}
class State {
    static let instance = State()
    private init(){
        
    }
    
    var nameTitle = ""
    var textField = ""
    var nameType = ""

}

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    @IBOutlet weak var predictionLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCamera()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func configureCamera() {
        
        //Start capture session
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo
        captureSession.startRunning()
        
        // Add input for capture
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let captureInput = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(captureInput)
        
        // Add preview layer
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame.size.width = 425
        previewLayer.frame.size.height = 650
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        //view.layer.addSublayer(previewLayer)
        //previewLayer.frame = view.layer.bounds
        
        // Add output for capture
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
    }
    
    // MARK: - AVCaptureVideoDataOutputSampleBufferDelegate
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        // Initialise CVPixelBuffer from sample buffer
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }

        //Initialise Core ML model
        guard let wasteModel = try? VNCoreMLModel(for: wastemodel().model) else { return }

        // Create a Core ML Vision request
        let request =  VNCoreMLRequest(model: wasteModel) { (finishedRequest, err) in

            // Dealing with the result of the Core ML Vision request
            guard let results = finishedRequest.results as? [VNClassificationObservation] else { return }

            guard let firstResult = results.first else { return }
            var predictionString = ""
            DispatchQueue.main.async {
                switch firstResult.identifier {
                case "bandaid":
                    predictionString = "Residual Waste"
                case "battery":
                    predictionString = "Hazardous Waste"
                case "bread":
                    predictionString = "Food Waste"
                case "bulb":
                    predictionString = "Hazardous Waste"
                case "cans":
                    predictionString = "Recyclable"
                case "carton":
                    predictionString = "Recyclable"
                case "chopsticks":
                    predictionString = "Residual Waste"
                case "diapers":
                    predictionString = "Residual Waste"
                case "dishes":
                    predictionString = "Residual Waste"
                case "facialmask":
                    predictionString = "Residual Waste"
                case "glassbottle":
                    predictionString = "Recyclable"
                case "leftovers":
                    predictionString = "Food Waste"
                case "medicinebottle":
                    predictionString = "Recyclable"
                case "milkbox":
                    predictionString = "Recyclable"
                case "napkin":
                    predictionString = "Residual Waste"
                case "newspaper":
                    predictionString = "Recyclable"
                case "nuts":
                    predictionString = "Recyclable"
                case "pen":
                    predictionString = "Residual Waste"
                case "plasticbag":
                    predictionString = "Recyclable"
                case "plasticbottle":
                    predictionString = "Recyclable"
                default:
                    predictionString = "Residual Waste"
                }

                self.predictionLabel.text = firstResult.identifier + predictionString + "(\(firstResult.confidence))"
                
                // first result identifier  = object
                // predictionString = recyable or not
                // first result. confidence = number
                
                
                if ((firstResult.confidence) >= 0.9) {
                    let controller = self.storyboard?.instantiateViewController(identifier: "secondVC") as! SViewController
                    // controller.nameLabel = self.predictionLabel
                    State.instance.textField = firstResult.identifier
                    State.instance.nameTitle = firstResult.identifier.capitalized
                    State.instance.nameType = predictionString
                    
                    // self.addChildViewController(controller)
//                    controller.text = predictionStrin
//                    controller.modalPresentationStyle = .fullScreen
                    self.present(controller, animated: true)
                }
                
            }
        }
        // Perform the above request using Vision Image Request Handler
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }

}

