//
//  ContentView.swift
//  Menu_Option_Button
//
//  Created by Sai Krishna on 3/18/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isExpanded = false
    var body: some View {
        VStack(spacing: 0){
            
            ZStack{
                if isExpanded{
                    Color.gray
                        .ignoresSafeArea()
                        .onTapGesture {
                            toggleMenu()
                        }
                    
                }
                ZStack{
                    menuOptions(icon: "folder", bgColor: .red)
                        .offset(x: isExpanded ? 55 : 0)
                        .opacity(isExpanded ? 1 : 0)
                        .zIndex(isExpanded ? 1 : 0)
                    menuOptions(icon: "paperplane.fill", bgColor: .blue)
                        .offset(x: isExpanded ? 50 : 0, y: isExpanded ? -55 : 0)
                        .opacity(isExpanded ? 1 : 0)
                        .zIndex(isExpanded ? 1 : 0)
                    menuOptions(icon: "doc.text.fill", bgColor: .orange)
                        .offset(y: isExpanded ? -80 : 0)
                        .opacity(isExpanded ? 1 : 0)
                        .zIndex(isExpanded ? 1 : 0)
                    menuOptions(icon: "bell.and.waveform", bgColor: .green)
                        .offset(x: isExpanded ? -50 : 0, y: isExpanded ? -55 : 0)
                        .opacity(isExpanded ? 1 : 0)
                        .zIndex(isExpanded ? 1 : 0)
                    menuOptions(icon: "icloud.and.arrow.down", bgColor: .yellow)
                        .offset(x: isExpanded ? -55 : 0)
                        .opacity(isExpanded ? 1 : 0)
                        .zIndex(isExpanded ? 1 : 0)
                    
                    
                    Button(action: {
                        toggleMenu()
                        
                    }, label: {
                        ZStack{
                            Circle()
                                .fill(Color.cyan)
                                .frame(width: 48, height: 48)
                            
                            Image(systemName: "plus")
                                .foregroundColor(Color.white)
                                .frame(width: 30)
                                .rotationEffect(.degrees(isExpanded ? 45 : 0))
                        }
                        .offset(y: isExpanded ? -20 : 0)
                    })
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                .padding(.bottom, 20)
            }
            Rectangle()
                .frame(height: 150)
        }
        .ignoresSafeArea()
    }
    
    private func menuOptions(icon: String, bgColor: Color) -> some View{
        Button(action: {
            print("\(icon) tapped")
        }, label: {
            ZStack{
                Circle()
                    .fill(bgColor)
                    .frame(width: 48, height: 48)
                
                Image(systemName: icon)
                    .frame(width: 18, height: 24)
                    .foregroundColor(Color.white)
            }
        })
    }
    
    func toggleMenu(){
        withAnimation(.spring(response: 0.4, dampingFraction: 0.7, blendDuration: 0)){
            isExpanded.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
