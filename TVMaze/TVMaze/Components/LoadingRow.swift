//
//  LoadingRow.swift
//  TVMaze
//
//  Created by Gerson Arbigaus on 04/07/23.
//

import SwiftUI

struct LoadingRow: View {
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            ProgressView()
                .frame(maxWidth: .infinity)
        }
        .padding()
    }
}

struct LoadingRow_Previews: PreviewProvider {
    static var previews: some View {
        LoadingRow()
    }
}
