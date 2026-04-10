Map createPerson(Map context) {

    def partyId = context.partyId
    def firstName = context.firstName
    def lastName = context.lastName
    def dateOfBirth = context.dateOfBirth

    // Validation
    if (!partyId || !firstName || !lastName) {
        return [error: "Missing required parameters"]
    }

    // Check Party exists
    def party = ec.entity.find("demo.DemoParty")
            .condition("partyId", partyId)
            .one()

    if (!party) {
        return [error: "Party with ID ${partyId} does not exist"]
    }

    // Create Person
    ec.entity.create("demo.DemoPerson", [
            partyId: partyId,
            firstName: firstName,
            lastName: lastName,
            dateOfBirth: dateOfBirth
    ])

    // Optional: log extra params
    context.each { k, v ->
        ec.logger.info("Param: $k = $v")
    }

    return [responseMessage: "Person ${firstName} ${lastName} created successfully!"]
}