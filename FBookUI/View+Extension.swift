//
//  View+Extension.swift
//  FBookUI
//
//  Created by odikk on 07/01/22.
//  Copyright © 2022 Devata Creative Digital. All rights reserved.
//

import Foundation
import SwiftUI
extension View {
     public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
         let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
         return clipShape(roundedRect)
              .overlay(roundedRect.strokeBorder(content, lineWidth: width))
     }
 }
