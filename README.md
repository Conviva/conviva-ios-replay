# Conviva iOS Replay SDK Integration Guide


> **Important:** 
Before enabling Cohort Replay in production, configure the sensitive data masking in the [Replay SDK](#masking-sensitive-data) and from the [Sensor Remote Control: Cohort Replay](https://pulse.conviva.com/app/activation/sensor-remote-control/session-replay) in Conviva Pulse. The SDK includes default masking for potentially sensitive information. If you modify masking settings or upgrade UI frameworks or system SDKs, thoroughly test your application to confirm masking works correctly. If you find any issues, contact Conviva customer support before enabling Cohort Replay in production.

## Overview
The Conviva iOS Replay SDK enables Cohort Replay capabilities for iOS applications, helping teams understand user interactions and troubleshoot issues effectively.

The Conviva iOS Replay SDK captures screen content changes at up to 1 frame per second (fps). By default, this feature works only on Wi-Fi. 

This document describes the prerequisites, integration steps, supported platforms, limitations, and available masking options while integrating the Replay SDK.

### Supported Platforms and Devices

- **Platforms:** iOS (15.0 and above) and iPadOS (15.0 and above)
- **Devices:** iPhone and iPad only. *Apple TV devices are not supported.*


---

## Prerequisites
Conviva iOS Replay SDK depends on Conviva iOS App Analytics SDK. First, integrate the Conviva iOS App Analytics SDK, and then integrate the Replay SDK into your application.

For **Conviva iOS App Analytics** SDK see:  
  [https://github.com/Conviva/conviva-ios-appanalytics](https://github.com/Conviva/conviva-ios-appanalytics)


---


## Installing iOS Replay SDK
Install the Conviva iOS Replay SDK using one of the following methods:

   - **Swift Package Manager**
   
     a. In Xcode, navigate to:\
        File → Add Package Dependency...
     
     b. Add the following repository URL:\
        https://github.com/Conviva/conviva-ios-replay

   - **Cocoapods**

     Add the following line to your Podfile, replacing <version> with the latest version:\
      pod 'ConvivaReplay', :git => 'https://github.com/Conviva/conviva-ios-replay.git', :tag => '0.0.1'

   - **Manual Install**
     
      a. Download the package from https://github.com/Conviva/conviva-ios-replay/releases
     
      b. In Xcode, go to Build Phases and add *ConvivaReplay.xcframework* to the Link Binary with Libraries section. This package contains frameworks for iOS and iPadOS.



> **Important Recommendation**
- *Conviva iOS Replay SDK is initialized automatically when the Conviva iOS Tracker (conviva-ios-tracker) is initialized in the application. The Cohort Replay feature is enabled according to your Conviva Pulse activation settings. Ensure the Conviva iOS Tracker is initialized as documented in the [Conviva iOS App Analytics SDK](https://github.com/Conviva/conviva-ios-appanalytics);*
- *For iOS, use Conviva Cohort Replay as the only solution and not integrating it alongside other SDKs. The app performance may degrade if you run replays from multiple app analytics providers, simultaneously.*

### Managing WebView Content
iOS Replay SDK captures WebView content. However, masking individual elements inside a WebView is not supported.

### Pause/Resume Cohort Replay for WebView content (Optional) 
You can pause and replay if an application does not require WebView content to be recorded. In such a case, pause replay when a user enters a WebView and resume it when that user leaves. By doing so, you can avoid capturing the WebView content, thereby reducing the size of the recorded content.

- To stop recording when a user navigates into the WebView, use **`CATAppAnalytics.stopReplay()`**.

- To Resume recording when the user navigates out of the WebView (that is, returning to the native screens), use **`CATAppAnalytics.startReplay()`**.

---

## Masking Sensitive Data 
The Cohort Replay feature allows you to mask specific UI components, ensuring that sensitive information is not captured and not displayed in recordings and thereby protecting user privacy.

### Default Masking of Sensitive UI Elements
By default, the Replay SDK masks UI elements, such as *emailAddress*, *password*, *newPassword*, *creditCardNumber*, *oneTimeCode*, and *telephoneNumber*.


### Manual Masking for UIKit
To mask any UIView, set its *accessibilityIdentifier* to a string (for example, "cr-no-capture"). The view is replaced with a redacted block in the recording. This ensures the component is masked and excluded from Replay recordings.
```swift
let sensitiveCardView = UIView(frame: CGRect(x: 20, y: 100, width: 200, height: 120))
sensitiveCardView.accessibilityIdentifier = "cr-no-capture"
```


### Manual Masking for SwiftUI
To mask a SwiftUI view, apply the `convivaReplayMask` modifier. Use `convivaReplayMask()` to ensure the component is masked and excluded from Replay recordings.

```swift
import ConvivaReplay

MySensitiveView()
    .convivaReplayMask(true)
```

Using `convivaReplayMask(true)` ensures that the component’s content is **masked in Replay recordings**. 


## Configure Cohort Replay in Pulse
Override Replay SDK's default masking while activating the sensor. Log in to Conviva Pulse and navigate to the [Sensor Remote Control: Cohort Replay](https://pulse.conviva.com/app/activation/sensor-remote-control/session-replay) to enable Cohort Replay and configure replay criteria as per your requirements. 


## Limitations

### Framework Limitation
The Replay SDK does not support iOS applications built using:
- React Native
- Flutter


### Other Limitations

- Captures only the primary app screen. Content displayed in overlapping layers—such as pop-ups, overlays, or floating panels—may appear incomplete or inaccurate.

- Does not capture out-of-process views such as system Contacts or Photos pickers.

- May briefly show partially visible masked text or images during screen transitions or certain animations.

- Does not capture screenshots during active scrolling, hence does not reflect intermediate scroll positions in the replay.


---

## Troubleshooting
If you encounter issues during integration or usage, contact Conviva Customer Support for assistance.


