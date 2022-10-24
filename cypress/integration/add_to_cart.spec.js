describe('home page', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it("When user clicks on cart 'Add to cart button it icreases by 1", () => {
    cy.get("button")
      .contains('Add')
      .click({ force: true });

    cy.get('.nav-link')
      .contains(" My Cart (1) ")
      .should('be.visible');
  });

});