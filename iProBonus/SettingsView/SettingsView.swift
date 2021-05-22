import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var userStore: UserStore
    @Binding var showSheetView: Bool
    
    let lightGreyColor = Color.gray.opacity(0.2)
    
    var body: some View {
        NavigationView {
            VStack {

                Text("Client ID")
                TextField("Client ID", text: $userStore.clientID)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                
                Text("Device ID")
                TextField("Device ID", text: $userStore.deviceID)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                
                Stepper("Title size: \(userStore.titleSize.clean)", value: $userStore.titleSize, in: 0...50)
                Stepper("Description size: \(userStore.descriptionSize.clean)", value: $userStore.descriptionSize, in: 0...50)
                ColorPicker("Background color", selection: $userStore.backgroundColor)
                
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
