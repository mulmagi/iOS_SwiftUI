//
//  QRScannerDelegate.swift
//  mulmagi_SwiftUI
//
//  Created by eunji on 2023/11/30.
//

import SwiftUI
import AVFoundation

// QRScan and Decode (Print Result at Console)
class QRScannerDelegate: NSObject, ObservableObject, AVCaptureMetadataOutputObjectsDelegate {
    @Published var isCorrectCode: Bool = false
    @Published var isUnable: Bool = false

    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        // AVCaptureMetadataOutput: Get Metadata Scanned as array.
        if let metaObject = metadataObjects.first { // first object of array
            guard let readableObject = metaObject as? AVMetadataMachineReadableCodeObject else { return }
            // Check first Object's Type.
            
            guard let scannedCode = readableObject.stringValue else { return }
            // Object's stringValue == QR Code's String Value.
            
            print(scannedCode)
            
            // TODO: Fix QR Number
            if scannedCode == "CustomData:748753" || scannedCode == "CustomData:695066" {
                DispatchQueue.main.async {
                    print("CORRECT")
                    self.isCorrectCode = true
                }
                
            }
            if scannedCode == "http://en.m.wikipedia.org" {
                DispatchQueue.main.async {
                    self.isUnable = true
                }
            }
        }
    }
}
