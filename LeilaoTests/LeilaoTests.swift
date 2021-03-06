//
//  LeilaoTests.swift
//  LeilaoTests
//
//  Created by Ândriu Coelho on 27/04/18.
//  Copyright © 2018 Alura. All rights reserved.
//

import XCTest
@testable import Leilao

class LeilaoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testDeveReceberUmLance(){
        
        let leilao =  Leilao(descricao: "Macbook Pro 15")
        XCTAssertEqual(0, leilao.lances?.count)
        
        let steveJobs = Usuario( nome: "Steve Jobs")
        leilao.propoe(lance: Lance(steveJobs, 2000.0))
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
    }
    
    func testDeveReceberVariosLances(){
        let leilao = Leilao(descricao: "Macbook Pro")
        let steveJobs = Usuario(nome: "Steve Jobs")
        
        leilao.propoe(lance:  Lance(steveJobs, 2000.0))
        
        let billGates = Usuario(nome: "Bill Gates")
        leilao.propoe(lance: Lance(billGates, 2500.0))
        
        XCTAssertEqual(2, leilao.lances?.count)
        
        XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
        XCTAssertEqual(2500.0, leilao.lances?[1].valor)
    }
    
    
    func testDeveIgnorarDoisLancesSeguidosDoMesmoUsuario(){
        let leilao = Leilao(descricao: "Macbook Pro")
        
        let steveJobs = Usuario(nome: "Steve Jobs")
        leilao.propoe(lance: Lance(steveJobs, 2000.0))
        leilao.propoe(lance: Lance(steveJobs, 2200.0))
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(2000.0, leilao.lances?.first?.valor)
    }
    
    
    func testDeveIgnorarMaisDoQue5LancesDoMesmoUsuario(){
        let leilao = Leilao(descricao: "MacBook Pro")
        let steveJobs = Usuario(nome: "Steve Jobs")
        let billGates = Usuario(nome: "Bill Gates")
        
        leilao.propoe(lance: Lance(steveJobs, 2000.0))
        leilao.propoe(lance: Lance(billGates, 2100.0))
        
        leilao.propoe(lance: Lance(steveJobs, 2200.0))
        leilao.propoe(lance: Lance(billGates, 2300.0))
        
        leilao.propoe(lance: Lance(steveJobs, 2400.0))
        leilao.propoe(lance: Lance(billGates, 2500.0))
        
        leilao.propoe(lance: Lance(steveJobs, 2600.0))
        leilao.propoe(lance: Lance(billGates, 2700.0))
        
        leilao.propoe(lance: Lance(steveJobs, 2800.0))
        leilao.propoe(lance: Lance(billGates, 2900.0))
        
        
        //deve ignorar
        
        leilao.propoe(lance:  Lance(steveJobs, 3200.0))
        
        
        XCTAssertEqual(10, leilao.lances?.count) //tamanho da lista
        XCTAssertEqual(2900.0, leilao.lances?.last?.valor) //ultimo item da lista
        
        
    }
}
