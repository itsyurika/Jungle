describe("Product details", () => {
  it("should visit root", () => {
    cy.visit("/");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("can click and navigate to the product page", () => {
    cy.get(".products article")
    .first()
    .click();

    cy.get(".products-show article")
    .should('exist');

    cy.get(".product-detail")
    .should('exist');

    cy.contains(".quantity", "in stock at")
    .should('exist');

  });

});
