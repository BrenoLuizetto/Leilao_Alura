//
//  AvaliadorTests.swift
//  LeilaoTests
//
//  Created by Breno Luizetto Cintra on 29/12/20.
//  Copyright © 2020 Alura. All rights reserved.
//

import XCTest
@testable import Leilao

class AvaliadorTests: XCTestCase {
    
    var leiloeiro:Avaliador!
    private var joao:Usuario!
    private var maria:Usuario!
    private var jose:Usuario!


    override func setUp() {
        joao = Usuario(nome: "Joao")
        jose = Usuario(nome: "Jose")
        maria = Usuario(nome: "Maria")
        leiloeiro = Avaliador()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDeveEntenderLancesEmOrderCrescente(){
        
        
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(maria, 250.0))
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(jose, 400.0))
        
        try? leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(250.0, leiloeiro.menorLance())
        XCTAssertEqual(400.0, leiloeiro.maiorLance())
    }
    
    func testDeveEntenderLeilaoComApenasUmLance(){
        
        let leilao = Leilao(descricao: "Playstatio4")
        leilao.propoe(lance: Lance(joao,1000.0))
        
        try? leiloeiro.avalia(leilao: leilao)
        
        
        XCTAssertEqual(1000.0, leiloeiro.menorLance())
        XCTAssertEqual(1000.0, leiloeiro.maiorLance())

        
    }
    
    func testeDeveEncontrarOsTresMaioresLances(){
        
        
        let leilao = CriadorDeLeilao().para(descricao: "Playstation 4")
                                                .lance(joao, 300.0)
                                                .lance(maria, 400.0)
                                                .lance(joao, 500.0)
                                                .lance(maria, 600.0).constroi()

        try? leiloeiro.avalia(leilao: leilao)
        
        let listaLances = leiloeiro.tresMaiores()
        
        XCTAssertEqual(3, listaLances.count)
        XCTAssertEqual(600.0, listaLances[0].valor)
        XCTAssertEqual(500.0, listaLances[1].valor)
        XCTAssertEqual(400.0, listaLances[2].valor)
        

    }
    
    func testDeveIgnorarLeilaoSemNennumLance(){
        let leilao = CriadorDeLeilao().para(descricao: "Playstation 4").constroi()
        
        
        //metodos com exceção
        XCTAssertThrowsError(try leiloeiro.avalia(leilao: leilao), "nao é possivel avaliar leilao sem lances"){(error) in
            print(error.localizedDescription)
        }
    }
    
    
    
    }


    

