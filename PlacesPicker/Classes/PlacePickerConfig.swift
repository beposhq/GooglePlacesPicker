//
//  PlacePickerConfig.swift
//  PlacePicker-iOS
//
//  Created by Piotr Bernad on 05/07/2019.
//  Copyright © 2019 Piotr Bernad. All rights reserved.
//

import Foundation
import GooglePlaces

@objc public class PlacePickerConfig: NSObject {
    public let listRenderer: PlacesListRenderer
    public let placeFields: GMSPlaceField
    public let pickerRenderer: PickerRenderer
    public let placesFilter: GMSAutocompleteFilter?
    public let initialCoordinate: CLLocationCoordinate2D?
    public let initialZoom: Float
    public let showCancelButton: Bool
    
    @objc public static func defaultConfig(coordinate cor:CLLocationCoordinate2D, showCancelButton:Bool = true) -> PlacePickerConfig {
        return PlacePickerConfig(initialCoordinate: cor, showCancelButton: showCancelButton)
    }
      
    public init(initialCoordinate: CLLocationCoordinate2D? = nil, showCancelButton: Bool = true) {
        self.listRenderer = DefaultPlacesListRenderer()
        self.placeFields = GMSPlaceField.defaultFields
        self.placesFilter = nil
        self.pickerRenderer = DefaultPickerRenderer()
        self.initialZoom = 16.0
        self.initialCoordinate = initialCoordinate
        self.showCancelButton = showCancelButton
    }
}

extension GMSPlaceField {
    public static var defaultFields: GMSPlaceField {
        return GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
                                       UInt(GMSPlaceField.placeID.rawValue) |
                                       UInt(GMSPlaceField.addressComponents.rawValue) |
                                       UInt(GMSPlaceField.coordinate.rawValue) |
                                       UInt(GMSPlaceField.formattedAddress.rawValue) |
                                       UInt(GMSPlaceField.photos.rawValue))
    }
}

