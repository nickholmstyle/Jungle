describe('Home page', () => {
  beforeEach(() => {
    cy.visit('/');
    cy.get(".products article").should("have.length", 2);
  });

  it("clicking on a product's image from the homepage takes the user to the product details page", () => {
    cy.get("img")
      .first()
      .click()
      .visit('/products/2')
  });

})