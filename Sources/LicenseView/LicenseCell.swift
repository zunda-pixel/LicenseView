//
//  LicenseCell.swift
//

import SwiftUI
import AttributedText

struct LicenseCell: View {
  let package: PackageModel
  
  @Environment(\.openURL) var openURL
  
  var body: some View {
    ScrollView {
      AttributedText(text: package.license)
        .font(.caption)
        .frame(maxWidth: .infinity)
    }
    .navigationTitle(package.name)
    .toolbar {
      ToolbarItem {
        Button {
          openURL(package.location)
        } label: {
          Image(systemName: "safari")
        }
      }
    }
  }
}

extension AttributedText {
  init(text: String) {
    self.init(text: text, prefixes: [], urlContainer: .init()) { _, _ in }
  }
}

struct LicenseCell_Preview: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      LicenseCell(package: .init(name: "AttributedText", location: .init(string: "https://github.com/zunda-pixel/AttributedText")!, license: "Apache License"))
    }
  }
}
