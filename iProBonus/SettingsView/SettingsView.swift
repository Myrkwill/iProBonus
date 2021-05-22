import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var userStore: UserStore
    @Binding var showSheetView: Bool
    
    let lightGreyColor = Color.gray.opacity(0.2)
    
    var body: some View {
        NavigationView {
            VStack {
                            
                Section(header: Text("Client ID")) {
                    TextField("Client ID", text: $userStore.clientID)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(5.0)
                }
                
                Section(header: Text("Device ID")) {
                    TextField("Device ID", text: $userStore.deviceID)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(5.0)
                }
                
                Section {
                    Stepper("Title size: \(userStore.titleSize.clean)", value: $userStore.titleSize, in: 0...50)
                    Stepper("Description size: \(userStore.descriptionSize.clean)", value: $userStore.descriptionSize, in: 0...50)
                }
                Section {
                    ColorPicker("Main color", selection: $userStore.mainColor)
                    ColorPicker("Secondary color", selection: $userStore.secondaryColor)
                }
                
                Spacer()
                
            }
            .navigationBarTitle(Text("Settings"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.showSheetView = false
            }) {
                Text("Done").bold()
            })
            .padding()
        }
    }
}
