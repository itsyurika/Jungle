describe("Product details", () => {
  it("should visit root", () => {
    cy.visit("/");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("should be able to add a product to cart", () => {
    cy.get(".products article")
    .first()
    .within(() => {

    cy.get('button')
    .should("include.text", "Add")

    cy.get('button')
    .click({force: true})
    });

    cy.get("nav .container")
    .get(".nav-item")
    .should("include.text", "My Cart")
    .and("include.text", "1")
  });

});
