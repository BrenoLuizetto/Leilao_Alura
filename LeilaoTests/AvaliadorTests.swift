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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDeveEntenderLancesEmOrderCrescente(){
        // Cenario
        
        let joao = Usuario(nome: "Joao")
        let jose = Usuario(nome: "Jose")
        let maria = Usuario(nome: "Maria")
        
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(maria, 250.0))
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(jose, 400.0))
        
        // Acao
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        // Validacao
        
        XCTAssertEqual(250.0, leiloeiro.menorLance())
        XCTAssertEqual(400.0, leiloeiro.maiorLance())
    }
    
    func testDeveEntenderLeilaoComApenasUmLance(){
        let joao = Usuario(nome: "Joao")
        let leilao = Leilao(descricao: "Playstatio4")
        leilao.propoe(lance: Lance(joao,1000.0))
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(1000.0, leiloeiro.menorLance())
        XCTAssertEqual(1000.0, leiloeiro.maiorLance())

        
    }
    
    func testeDeveEncontrarOsTresMaioresLances(){
        let joao = Usuario(nome: "Joao")
        let maria = Usuario(nome: "Maria")
        
        let leilao = Leilao(descricao: "Playstation 4")
        
        leilao.propoe(lance: Lance(joao, 1000.0))
        leilao.propoe(lance: Lance(maria, 1100.0))
        leilao.propoe(lance: Lance(joao, 1500.0))
        leilao.propoe(lance: Lance(maria, 2000.0))
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        let listaLances = leiloeiro.tresMaiores()
        
        XCTAssertEqual(3, listaLances.count)
        XCTAssertEqual(2000.0, listaLances[0].valor)
        XCTAssertEqual(1500.0, listaLances[1].valor)
        XCTAssertEqual(1100.0, listaLances[2].valor)
        

    }
    
    }


    

