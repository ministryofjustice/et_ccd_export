json.set! "data" do
  json.set! "caseAssignee", "Bristol"
  json.set! "caseType", "Single"
  json.set! "claimantType" do
    json.set! "claimant_title", "Mr"
    json.set! "claimant_first_name", "Gary"
    json.set! "claimant_initials", nil
    json.set! "claimant_last_name", "Taylor"
    json.set! "claimant_date_of_birth", nil
    json.set! "claimant_gender", ""
    json.set! "claimant_addressUK" do
      json.set! "AddressLine1", nil
      json.set! "AddressLine2", nil
      json.set! "AddressLine3", nil
      json.set! "PostTown", nil
      json.set! "County", nil
      json.set! "PostCode", nil
      json.set! "Country", nil
    end
    json.set! "claimant_phone_number", nil
    json.set! "claimant_mobile_number", nil
    json.set! "claimant_fax_number", nil
    json.set! "claimant_email_address", nil
    json.set! "claimant_contact_preference", ""
  end
  json.set! "representedType" do
    json.set! "if_represented", "No"
  end
  json.set! "receiptDate", "2017-01-01"
  json.set! "feeGroupReference", nil
  json.set! "respondentType" do
    json.set! "respondent_name", nil
    json.set! "respondent_address" do
      json.set! "AddressLine1", nil
      json.set! "AddressLine2", nil
      json.set! "AddressLine3", nil
      json.set! "PostTown", nil
      json.set! "County", nil
      json.set! "PostCode", nil
      json.set! "Country", nil
    end
    json.set! "respondent_phone1", nil
    json.set! "respondent_phone2", nil
    json.set! "respondent_fax", nil
    json.set! "respondent_email", nil
    json.set! "respondent_contact_preference", ""
  end
  json.set! "respondentCollection", []
  json.set! "caseNote", "sdsd"
end
json.set! "event" do
  json.set! "id", "initiateCase"
  json.set! "summary", ""
  json.set! "description", ""
end
json.set! "event_token", event_token
json.set! "ignore_warning", false
json.set! "draft_id", nil
