import QtQuick 2.0
import QtMultimedia 5.6
Item {
 /*   Layout.fillWidth: true
    Layout.fillHeight: true
    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
    Layout.minimumHeight: parent.height*/
 //   Layout.minimumWidth:  parent.width
//

   Camera {
        id: camera
        position: Camera.FrontFace

        imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

        exposure {
            exposureCompensation: -1.0
            exposureMode: Camera.ExposurePortrait
        }

        flash.mode: Camera.FlashRedEyeReduction

        imageCapture {
            onImageCaptured: {
                photoPreview.source = preview  // Show the preview in an Image
            }
        }
    }

    VideoOutput {
        source: camera
                                anchors.fill: parent
        orientation: 270

        focus : visible // to receive focus and capture key events when visible
    }
    Image {
        id: photoPreview
        anchors.fill: parent
    }


}
