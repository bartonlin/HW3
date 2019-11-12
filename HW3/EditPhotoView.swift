//
//  EditPhotoView.swift
//  HW3
//
//  Created by User01 on 2019/11/12.
//  Copyright © 2019 User01. All rights reserved.
//

import SwiftUI

struct EditPhotoView: View {
    @State private var brightnessAmount: Double = 0
    @State private var selectedIndex = 0
    @State private var changeDLC = false
    @State private var textInput = false
    @State private var textData = ""
    var DLC = ["BLACK_ICE", "DUST_LINE", "SKULL_RAIN", "RED_CROWN"]
    var DLC_Time = ["第 1 年第 1 季", "第 1 年第 2 季", "第 1 年第 3 季", "第 1 年第 4 季"]
    var DLC_Name = ["黑冰行動", "塵土戰線行動", "骷顱雨行動", "赤鴉行動"]
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Image((self.DLC[self.selectedIndex]))
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.width / 4 * 3)
                    .clipped().brightness(self.brightnessAmount)
                Text((self.DLC_Time[self.selectedIndex]))
                Button("輸入評論"){
                    self.textInput = true
                }
                if self.textInput{
                    TextField("Input", text: self.$textData)
                }
                Form{
                    Text("亮度")
                    Slider(value: self.$brightnessAmount, in: 0...1,minimumValueLabel: Image(systemName: "sun.max.fill").imageScale(.small),maximumValueLabel: Image(systemName: "sun.max.fill").imageScale(.large)){Text("")}
                    Toggle("更換賽季", isOn: self.$changeDLC)
                    if self.changeDLC{
                        Stepper(value: self.$selectedIndex, in: 0...3){
                            Text("下一賽季")
                        }
                        Picker(selection: self.$selectedIndex, label: Text("選擇賽季")) {
                            Text(self.DLC_Name[0]).tag(0)
                            Text(self.DLC_Name[1]).tag(1)
                            Text(self.DLC_Name[2]).tag(2)
                            Text(self.DLC_Name[3]).tag(3)
                        }.pickerStyle(WheelPickerStyle())
                    }
                }
            }
        }
    }
}

struct EditPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        EditPhotoView()
    }
}
