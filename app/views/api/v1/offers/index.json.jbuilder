json.array! @offers do |offer|
  json.extract! offer, :full_price, :price_with_discount, :discount_percentage, :start_date, :enrollment_semester, :enabled
  json.course do
    json.name offer.course.name
    json.kind offer.course.kind
    json.level offer.course.level
    json.shift offer.course.shift
  end
  json.university do
    json.name offer.course.university.name
    json.score offer.course.university.score
    json.logo_url offer.course.university.logo_url
  end
  json.campus do
    json.name offer.course.campus.name
    json.city offer.course.campus.city
  end
end