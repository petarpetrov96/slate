# Requirements:
# jsonscheme2md installed
# referrals-api pulled to latest master next to slate project

echo "(Re)generating documentation"
jsonschema2md -e json -d ../referrals-api/src/utils/referral/flights/schemas -o ../referrals-api/src/utils/referral/flights/docs
jsonschema2md -e json -d ../referrals-api/src/utils/referral/hotels/schemas -o ../referrals-api/src/utils/referral/hotels/docs
jsonschema2md -e json -d ../referrals-api/src/utils/referral/cars/schemas -o ../referrals-api/src/utils/referral/cars/docs

echo "Parsing ..."
# Parsing the generated MD files and
#   * Fixing the headings;
#   * Removing the json files links
sed s/^#/##/g ../referrals-api/src/utils/referral/flights/docs/dayView.md | sed s/[\\[\|\(][a-zA-Z]*View\.json[\]\|\)]//g > source/includes/_flights_dayView.md
sed s/^#/##/g ../referrals-api/src/utils/referral/flights/docs/browseView.md | sed s/[\\[\|\(][a-zA-Z]*View\.json[\]\|\)]//g > source/includes/_flights_browseView.md
sed s/^#/##/g ../referrals-api/src/utils/referral/flights/docs/calendarMonthView.md | sed s/[\\[\|\(][a-zA-Z]*View\.json[\]\|\)]//g > source/includes/_flights_calendarMonthView.md
sed s/^#/##/g ../referrals-api/src/utils/referral/flights/docs/multiCity.md | sed s/[\\[\|\(][a-zA-Z]*City\.json[\]\|\)]//g > source/includes/_flights_multiCity.md
sed s/^#/##/g ../referrals-api/src/utils/referral/hotels/docs/dayView.md | sed s/[\\[\|\(][a-zA-Z]*View\.json[\]\|\)]//g > source/includes/_hotels_dayView.md
sed s/^#/##/g ../referrals-api/src/utils/referral/hotels/docs/homeView.md | sed s/[\\[\|\(][a-zA-Z]*View\.json[\]\|\)]//g > source/includes/_hotels_homeView.md
sed s/^#/##/g ../referrals-api/src/utils/referral/cars/docs/dayView.md | sed s/[\\[\|\(][a-zA-Z]*View\.json[\]\|\)]//g > source/includes/_cars_dayView.md
