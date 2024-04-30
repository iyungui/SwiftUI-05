//
//  NoteDetailView.swift
//  FirebaseBasic
//
//  Created by 이융의 on 4/30/24.
//

import SwiftUI

struct NoteDetailView: View {
    var note: Note
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    NoteDetailView(note: Note.sampleWithLongBody)
}
