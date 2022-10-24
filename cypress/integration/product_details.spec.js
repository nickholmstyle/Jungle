describe('Home page', () => {
  beforeEach(() => {
    cy.visit('/');
    cy.get(".products article").should("have.length", 2);
  });

  it("clicking on a product's image from the homepage takes the user to the product page", () => {
    cy.get("img")
      .first()
      .click()
      .visit('/products/2')
  });

  it("clicking on a product's name from the homepage takes the user to the product page", () => {
    cy.get("h1")
      .contains("Scented Blade")
      .click({ force:true })
      .visit('/products/2')
  });

});