"""empty message

Revision ID: abd4d57800f2
Revises: 429dcb5d5e58
Create Date: 2024-03-18 16:32:15.126434

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'abd4d57800f2'
down_revision = '429dcb5d5e58'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('student', schema=None) as batch_op:
        batch_op.add_column(sa.Column('rollno', sa.Integer(), nullable=True))
        batch_op.create_unique_constraint(None, ['rollno'])

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('student', schema=None) as batch_op:
        batch_op.drop_constraint(None, type_='unique')
        batch_op.drop_column('rollno')

    # ### end Alembic commands ###
