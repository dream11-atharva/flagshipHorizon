// Sources/OpenFeatureAdapter/FlagshipHorizonProvider.swift
import Foundation
import Combine
import OpenFeature

public struct FlagshipHorizonMetadata: ProviderMetadata {
    public var name: String? = "FlagshipHorizon"
}

public final class FlagshipHorizonProvider: FeatureProvider {
    // MARK: EventPublisher
    private let subject = PassthroughSubject<ProviderEvent?, Never>()
    public func observe() -> AnyPublisher<ProviderEvent?, Never> {
        subject.eraseToAnyPublisher()
    }

    // MARK: FeatureProvider
    public var hooks: [any Hook] = []
    public var metadata: ProviderMetadata = FlagshipHorizonMetadata()

    public init() {
        print("++++++ inside FlagshipHorizonProvider init")
    }

    // Lifecycle (no-ops for now)
    public func initialize(initialContext: EvaluationContext?) async { }
    public func onContextSet(oldContext: EvaluationContext?, newContext: EvaluationContext) async { }
    public func shutdown() async { }

    // MARK: Evaluations — use Core SDK
    public func getBooleanEvaluation(
        key: String,
        defaultValue: Bool,
        context: EvaluationContext?
    ) -> ProviderEvaluation<Bool> {
        let value = FlagshipHorizon.shared.getBooleanFlag(key: key, defaultValue: defaultValue)
        return ProviderEvaluation(
            value: value,
            reason: value == defaultValue ? Reason.defaultReason.rawValue : Reason.targetingMatch.rawValue,
            errorCode: value == defaultValue ? .flagNotFound : nil
        )
    }

    public func getStringEvaluation(
        key: String,
        defaultValue: String,
        context: EvaluationContext?
    ) -> ProviderEvaluation<String> {
        let value = FlagshipHorizon.shared.getStringFlag(key: key, defaultValue: defaultValue)
        return ProviderEvaluation(
            value: value,
            reason: value == defaultValue ? Reason.defaultReason.rawValue : Reason.targetingMatch.rawValue,
            errorCode: value == defaultValue ? .flagNotFound : nil
        )
    }

    public func getIntegerEvaluation(
        key: String,
        defaultValue: Int64,
        context: EvaluationContext?
    ) -> ProviderEvaluation<Int64> {
        let value = Int64(FlagshipHorizon.shared.getIntegerFlag(key: key, defaultValue: Int(defaultValue)))
        return ProviderEvaluation(
            value: value,
            reason: value == defaultValue ? Reason.defaultReason.rawValue : Reason.targetingMatch.rawValue,
            errorCode: value == defaultValue ? .flagNotFound : nil
        )
    }

    public func getDoubleEvaluation(
        key: String,
        defaultValue: Double,
        context: EvaluationContext?
    ) -> ProviderEvaluation<Double> {
        let value = FlagshipHorizon.shared.getDoubleFlag(key: key, defaultValue: defaultValue)
        return ProviderEvaluation(
            value: value,
            reason: value == defaultValue ? Reason.defaultReason.rawValue : Reason.targetingMatch.rawValue,
            errorCode: value == defaultValue ? .flagNotFound : nil
        )
    }

    public func getObjectEvaluation(
        key: String,
        defaultValue: OpenFeature.Value,
        context: EvaluationContext?
    ) -> ProviderEvaluation<Value> {
        // For now, return default for object evaluation
        return ProviderEvaluation(
            value: defaultValue,
            reason: Reason.defaultReason.rawValue,
            errorCode: .flagNotFound
        )
    }
}
