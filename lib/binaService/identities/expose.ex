defmodule BinaService.Identities.Expose do
#converts identities to their actors equivilent for another domain

#used like Identities.Expose.convert(:domain, model)

  def convert(:provider, m), do: m * m
  def convert(:consumer, m), do: m * m

  def convert(:custom, m, title) do
      #Allows for dynamically adding particles/fields
      #consider the predefined base sales identities: consumer and provider
      #same consumer may need to be specified as Staff. Therefore association with other contexts
      # can be simplified by using the uuid of the model to construct a map of the model only after validati
      # that it exists as a user and automatiucallyy attaching its access token so other model can validate that the records
      # are

      #makes it easier for the platform to impliment vast/sacalable identity types

      # Another module Check that title exists as table name in repo


  end




end
# defmodule MeterToLengthConverter
# def convert(:feet, m), do: m *
# def convert(:inch, m), do: m *
# def convert(:yard, m), do: m *
# end
