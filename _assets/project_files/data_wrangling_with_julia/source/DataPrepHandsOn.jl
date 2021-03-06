##
using CSV, DataFrames

df_airbnb = DataFrame(CSV.File("./mywebsite/_assets/project_files/data_wrangling_with_julia/source/airbnb.csv"))

describe(df_airbnb)

@show size(df_airbnb)

columns_needed = [
   "host_is_superhost",
   "cancellation_policy",
   "instant_bookable",
   "host_total_listings_count",
   "neighbourhood_cleansed",
   "zipcode",
   "latitude",
   "longitude",
   "property_type",
   "room_type",
   "accommodates",
   "bathrooms",
   "bedrooms",
   "beds",
   "bed_type",
   "minimum_nights",
   "number_of_reviews",
   "review_scores_rating",
   "review_scores_accuracy",
   "review_scores_cleanliness",
   "review_scores_checkin",
   "review_scores_communication",
   "review_scores_location",
   "review_scores_value",
   "price"]

df_cleaned = df_airbnb[!, columns_needed]

vscodedisplay(df_cleaned)

mapcols(eltype, df_cleaned)
[names(df_cleaned) eltype.(eachcol(df_cleaned))]

df_cleaned.price .= passmissing(x -> replace(x, (r"[\$,]" => ""))).(df_cleaned.price)
df_cleaned.price = passmissing(parse).(Float64, df_cleaned.price)

describe(df_cleaned[!, ["host_is_superhost", "host_total_listings_count", "zipcode"]])

df_cleaned_NaN_zip = dropmissing(df_cleaned, "zipcode")
[names(df_cleaned_NaN_zip) eltype.(eachcol(df_cleaned_NaN_zip))]


using Statistics; using Impute
impute_cols = [
  "bedrooms",
  "bathrooms",
  "beds",
  "review_scores_rating",
  "review_scores_accuracy",
  "review_scores_cleanliness",
  "review_scores_checkin",
  "review_scores_communication",
  "review_scores_location",
  "review_scores_value"
]

df_imputed = copy(df_cleaned_NaN_zip)

df_imputed[!, impute_cols] = Impute.substitute(df_cleaned_NaN_zip[!, impute_cols], statistic=median)

describe(df_imputed)

disallowmissing!(df_imputed)