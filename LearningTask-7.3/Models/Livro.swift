//
//  Livro.swift
//  LearningTask-7.3
//
//  Created by Italo cavalcanti on 07/11/22.
//

import Foundation

struct Livro {
    var titulo: String
    var imagem: String
    
    init(titulo: String) {
        self.titulo = titulo
        self.imagem = titulo
    }
}

extension Livro: DataLivroViewCell {}
