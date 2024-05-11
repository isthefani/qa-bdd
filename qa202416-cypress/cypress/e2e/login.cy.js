/// <reference types="cypress" />

context('Login do Saucedemo', () => {
    beforeEach(() => {
        cy.visit('https://www.saucedemo.com/v1/')
    });

    it('Login válido', () => {
        cy.get('[data-test="username"]').type('standard_user')
        cy.get('[data-test="password"]').type('secret_sauce')
        cy.get('#login-button').click()
        cy.get('.product_label').should('contain','Products')

    });
    
    it('Login invalido', () => {
        cy.get('[data-test="username"]').type('invalid_user')
        cy.get('[data-test="password"]').type('secret_sauce')
        cy.get('#login-button').click()
        cy.get('[data-test="error"]').should('have.text','Epic sadface: Username and password do not match any user in this service')

    });

    it('Falhas no Login', () => {

        cy.fixture('users_fail.json').then((dados) => {

            dados.usuarios.forEach((usuario) => {

                cy.get('[data-test="username"]').clear().type(usuario.user)
                cy.get('[data-test="password"]').clear().type(usuario.password)
                if (usuario.usuario != '') {
                    cy.get('[data-test="username"]').type(usuario.user)
                }
                if (usuario.usuario != '') {
                    cy.get('[data-test="password"]').type(usuario.password)
                }
                cy.get('#login-button').click()
                cy.get('[data-test="error"]').should('have.text',usuario.message)
            })
        })

    });

})