//
//  RMSettingsView.swift
//  RickAndMorty
//
//  Created by Guowei Lv on 9.4.2024.
//

import SwiftUI

struct RMSettingsView: View {
    
    let viewModel: RMSettingsViewViewModel
    
    init(viewModel: RMSettingsViewViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
     List(viewModel.cellViewModels) { viewModel in
         HStack {
             if let image = viewModel.image {
                 Image(uiImage: image)
                     .resizable()
                     .renderingMode(.template)
                     .foregroundColor(Color.white)
                     .aspectRatio(contentMode: .fit)
                     .frame(width: 20, height: 20)
                     .padding(8)
                     .tint(Color.white)
                     .background(Color(viewModel.iconContainerColor))
                     .cornerRadius(6)
             }
             Text(viewModel.title).padding(.leading, 10)
         }
         .padding(.bottom, 3)
             .onTapGesture {
                 viewModel.onTapHandler(viewModel.type)
             }
         
        }
    }
}

#Preview {
    RMSettingsView(viewModel: .init(cellViewModels: RMSettingsOption.allCases.compactMap({ option in
            .init(type: option) { _ in
                
            }
    })))
}
