% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get-fields.R
\name{get_fields}
\alias{get_fields}
\title{Get field list}
\usage{
get_fields(endpoint, groups = NULL)
}
\arguments{
\item{endpoint}{A length 1 character vector giving the API endpoint you will be searching.}

\item{groups}{A character vector giving the group(s) whose fields you want returned. A value of \code{NULL} indicates that you want all of the endpoint's fields (i.e., do not filter the field list based on group membership). \code{groups} can be one or more of the following: \code{"applications", "assignees", "cpcs", "gov_interests", "inventors", "ipcs", "locations", "nbers", "patents", "rawinventors", "uspcs", "wipos", "years", "cpc_subsections", "cpc_subgroups", "coinventors", "coinvetnros", "application_citations", "cited_patents", "citedby_patents", "nber_subcategories", "uspc_mainclasses", "uspc_subclasses"}. See the online field tables to see which fields are included in which groups (e.g., see the first two columns of the \href{http://www.patentsview.org/api/patent.html#field_list}{patents field list table}).}
}
\value{
A character vector with field names.
}
\description{
This function returns a list of fields that a given endpoint will provide data on (i.e., the fields you can pass to the \code{fields} argument in \code{\link{search_pv}}). You can limit these fields to only cover certain entity group(s) as well (which is reccomened, given the large number of possible fields for each endpoint).
}
\examples{
# Get the fields in the "assignees" group for the patents endpoint:
fields <- get_fields("patents", "assignees")

# ...Ask the server for these fields:
search_pv(query = '{"_gte":{"patent_date":"2007-01-04"}}',
          fields = fields, endpoint = "patents")

# ...Pull patent and assignee-level fields:
search_pv(query = '{"_gte":{"patent_date":"2007-01-04"}}',
          fields = get_fields("patents", c("patents", "assignees")),
          endpoint = "patents")

}
