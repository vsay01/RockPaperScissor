//
//  TextViewModifier.swift
//  RockPaperScissors
//
//  Created by vsay on 1/6/23.
//

// This is created to have text style in one place. Topic: ViewModifier
import SwiftUI

struct TitleViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title.bold())
            .foregroundStyle(.regularMaterial)
            .padding()
    }
}

struct TitleBlackViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title.bold())
            .foregroundStyle(.black)
            .padding()
    }
}

struct SubTitleViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title.bold())
            .foregroundStyle(.black)
            .padding()
    }
}

struct BodyViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body.bold())
            .foregroundStyle(.black)
            .padding()
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(TitleViewModifier())
    }
    
    func titleWhiteWithBackgroundStyle() -> some View {
        modifier(TitleBlackViewModifier())
    }
    
    func subTitleStyle() -> some View {
        modifier(SubTitleViewModifier())
    }
    
    func bodyStyle() -> some View {
        modifier(BodyViewModifier())
    }
}
