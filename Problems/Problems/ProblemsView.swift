//
//  ProblemsView.swift
//  Problems
//
//  Created by Nicholas Richards on 11/23/22.
//

import SwiftUI

struct ProblemButton: View {
    var action: () -> Void
    var name: String
    var body: some View {
        Button(action: action) {
            Text(name)
        }
    }
}

struct ProblemsView: View {
    var problems: [Problem]
    var body: some View {
        ForEach(problems) { problem in
            ProblemButton(
                action: problem.action,
                name: problem.name)
        }
    }
}
