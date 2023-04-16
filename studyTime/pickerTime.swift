//
//  pickerTime.swift
//  studyTime
//
//  Created by Михаил Куприянов on 16.04.2023.
//

import SwiftUI

struct pickerTime: View {
    @State private var hour = 1
    
    var body: some View {
        VStack {
            Text("\(hour)")
        }
        
    }
}

struct pickerTime_Previews: PreviewProvider {
    static var previews: some View {
        pickerTime()
    }
}
