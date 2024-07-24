//
//  PagerView.swift
//  MyNetflix
//
//  Created by Ding Lo on 23/7/2024.
//

import SwiftUI

struct PagerView<Content: View>: View {
    let pageCount: Int
    let externalDragGesture: _EndedGesture<_ChangedGesture<DragGesture>>
    let content: Content
    
    @Binding var currentIndex: Int
    @Binding var translation: CGFloat
    @State private var verticalDragIsActive = false
    
    init (
        pageCount: Int,
        currentIndex: Binding<Int>,
        translation: Binding<CGFloat>,
        externalDeagGesture: _EndedGesture<_ChangedGesture<DragGesture>>,
        @ViewBuilder content: () -> Content
        
    ) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self._translation = translation
        self.externalDragGesture = externalDeagGesture
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                content.frame(width: geo.size.width)
            }
            .frame(width: geo.size.width, alignment: .leading)
            .offset(x: -CGFloat(currentIndex) * geo.size.width)
            .offset(x: translation)
            .animation(.interactiveSpring(), value: UUID())
            .gesture(
                externalDragGesture.simultaneously(with:
                    DragGesture(minimumDistance: 20)
                        .onChanged({ value in
                            if verticalDragIsActive {
                                return
                            }
                            if abs(value.translation.width) < abs(value.translation.height) {
                                verticalDragIsActive = true
                                return
                            }

                            translation = value.translation.width
                        })
                        .onEnded({ value in
                            if verticalDragIsActive {
                                verticalDragIsActive = false
                                return
                            }
                            
                            let offset = value.translation.width / geo.size.width
                            let newIdx = (CGFloat(self.currentIndex) - offset).rounded()
                            currentIndex = min(max(Int(newIdx), 0), pageCount - 1)
                            translation = 0
                        })
                )
            )
        }
    }
}

//struct PagerDummy: View {
//    @State private var currentIndex: Int = 0
//    @State private var translation: CGFloat = .zero
//    
//    var body: some View {
//        PagerView(pageCount: 3, currentIndex: $currentIndex, translation: $translation) {
//            Color.red
//            Color.blue
//            Color.black
//        }
//    }
//}
//
//#Preview {
//    ZStack {
////        Color.black
////            .ignoresSafeArea()
//        PagerDummy()
//    }
//}
