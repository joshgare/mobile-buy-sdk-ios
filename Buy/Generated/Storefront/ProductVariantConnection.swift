// Generated from graphql_swift_gen gem
import Foundation

extension Storefront {
	open class ProductVariantConnectionQuery: GraphQL.AbstractQuery, GraphQLQuery {
		public typealias Response = ProductVariantConnection

		@discardableResult
		open func edges(aliasSuffix: String? = nil, _ subfields: (ProductVariantEdgeQuery) -> Void) -> ProductVariantConnectionQuery {
			let subquery = ProductVariantEdgeQuery()
			subfields(subquery)

			addField(field: "edges", aliasSuffix: aliasSuffix, subfields: subquery)
			return self
		}

		@discardableResult
		open func pageInfo(aliasSuffix: String? = nil, _ subfields: (PageInfoQuery) -> Void) -> ProductVariantConnectionQuery {
			let subquery = PageInfoQuery()
			subfields(subquery)

			addField(field: "pageInfo", aliasSuffix: aliasSuffix, subfields: subquery)
			return self
		}
	}

	open class ProductVariantConnection: GraphQL.AbstractResponse, GraphQLObject {
		public typealias Query = ProductVariantConnectionQuery

		open override func deserializeValue(fieldName: String, value: Any) throws -> Any? {
			let fieldValue = value
			switch fieldName {
				case "edges":
				guard let value = value as? [[String: Any]] else {
					throw SchemaViolationError(type: type(of: self), field: fieldName, value: fieldValue)
				}
				return try value.map { return try ProductVariantEdge(fields: $0) }

				case "pageInfo":
				guard let value = value as? [String: Any] else {
					throw SchemaViolationError(type: type(of: self), field: fieldName, value: fieldValue)
				}
				return try PageInfo(fields: value)

				default:
				throw SchemaViolationError(type: type(of: self), field: fieldName, value: fieldValue)
			}
		}

		open var typeName: String { return "ProductVariantConnection" }

		open var edges: [Storefront.ProductVariantEdge] {
			return internalGetEdges()
		}

		func internalGetEdges(aliasSuffix: String? = nil) -> [Storefront.ProductVariantEdge] {
			return field(field: "edges", aliasSuffix: aliasSuffix) as! [Storefront.ProductVariantEdge]
		}

		open var pageInfo: Storefront.PageInfo {
			return internalGetPageInfo()
		}

		func internalGetPageInfo(aliasSuffix: String? = nil) -> Storefront.PageInfo {
			return field(field: "pageInfo", aliasSuffix: aliasSuffix) as! Storefront.PageInfo
		}

		override open func childObjectType(key: String) -> GraphQL.ChildObjectType {
			switch(key) {
				case "edges":

				return .ObjectList

				case "pageInfo":

				return .Object

				default:
				return .Scalar
			}
		}

		override open func fetchChildObject(key: String) -> GraphQL.AbstractResponse? {
			switch(key) {
				case "pageInfo":
				return internalGetPageInfo()

				default:
				break
			}
			return nil
		}

		override open func fetchChildObjectList(key: String) -> [GraphQL.AbstractResponse] {
			switch(key) {
				case "edges":
				return internalGetEdges()

				default:
				return []
			}
		}

		open func childResponseObjectMap() -> [GraphQL.AbstractResponse]  {
			var response: [GraphQL.AbstractResponse] = []
			objectMap.keys.forEach({
				key in
				switch(key) {
					case "edges":
					internalGetEdges().forEach {
						response.append($0)
						response.append(contentsOf: $0.childResponseObjectMap())
					}

					case "pageInfo":
					response.append(internalGetPageInfo())
					response.append(contentsOf: internalGetPageInfo().childResponseObjectMap())

					default:
					break
				}
			})
			return response
		}

		open func responseObject() -> GraphQL.AbstractResponse {
			return self as GraphQL.AbstractResponse
		}
	}
}
