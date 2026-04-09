import type { transaction } from "types/supabase";

function LogCard({ transaction }: { transaction: transaction }) {
    return (
        <article className="columns">
            <div className="column is-three-quarters">
                {transaction.logger.firstName}
                {transaction.quantityChanged > 0 && "+"}
                {transaction.quantityChanged} {transaction.product.name}
            </div>
            <div className="column">
                {transaction.creationTimestamp.toString()}
            </div>
        </article>
    );
}

export default LogCard;
